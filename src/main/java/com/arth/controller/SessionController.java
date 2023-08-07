package com.arth.controller;

import java.io.InputStreamReader;

import java.io.Reader;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.arth.dto.LoginDto;
import com.arth.dto.ResetPasswordDto;
import com.arth.entity.FaqsEntity;
import com.arth.entity.IndustryEntity;
import com.arth.entity.RoleEntity;
import com.arth.entity.UserEntity;
import com.arth.repository.FaqRepository;
import com.arth.repository.IndustryRepository;
import com.arth.repository.RoleRepository;
import com.arth.repository.UserRepository;
import com.arth.services.MailerService;
import com.arth.services.OtpGenerator;
import com.opencsv.CSVReader;

@Controller
public class SessionController 
{
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	RoleRepository roleRepo;
	
	@Autowired
	IndustryRepository industryRepo;
	
	@Autowired
	FaqRepository faqRepo;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	OtpGenerator otpGeneratorService;

	@Autowired
	MailerService mailerService;
	
	
	
	@GetMapping("signup")
	public String signUp()
	{
		return "SignUp";
	}
	
	
	@GetMapping(value = { "/","login"})
	public String login()
	{
		return "Login";
	}
	
	@PostMapping("saveuser")
	public String saveUser(UserEntity user)
	{
		String encoPassword = bcryptPasswordEncoder.encode(user.getPassword());
		user.setPassword(encoPassword);
		
		RoleEntity role = roleRepo.findByRoleName("USER");
		user.setRole(role);
		
		userRepo.save(user);
		
		return "Login";
	}
	
	@PostMapping("authenticate")
	public String authenticate(LoginDto loginDto,Model model)
	{
		
		Optional<UserEntity> opt = userRepo.findByEmail(loginDto.getEmail());

		if (opt.isPresent()) 
		{
			UserEntity user = opt.get();
			if(user.getDeletedAt() == null)
			{
				if (bcryptPasswordEncoder.matches(loginDto.getPassword(), user.getPassword())) {
					//
					return "Home";
				}
		
			}
		}
		model.addAttribute("error","Invalid Credentials...");
		return "Login";
	}
	
	@GetMapping("forgotpassword")
	public String forgotPwd()
	{
		return "ForgotPassword";
	}
	
	@PostMapping("forgotpassword")
	public String forgotPassword(LoginDto loginDto,Model model)
	{
		Optional<UserEntity> opt = userRepo.findByEmail(loginDto.getEmail());
		UserEntity user = opt.get();
		
		if(user.getDeletedAt() == null)
		{
			if(opt.isPresent())
			{
				String otp = otpGeneratorService.generateOtp(6);
				Date createdDate = new Date();
				long validityTime = createdDate.getTime()+ (180*1000);
				Date validityDate = new Date(validityTime);
	//			System.out.println(currentDate);
	
				user.setOtp(otp);
				
				Runnable r = () ->{
					
					mailerService.sendMailForForgetpasswordOTP(user);
				};
				Thread t = new Thread(r);
				t.start();
				user.setOtpCreated(createdDate);
				user.setOtpValidity(validityDate);
				userRepo.save(user);
				return "ChangePassword";
			}
		}else 
		{
			model.addAttribute("error","Invalid email please check again or Sign up");
		}
		return "ForgotPassword";
	}
	
	@PostMapping("changepassword")
	public String changePassword(ResetPasswordDto rDto, Model model)
	{
		Optional<UserEntity> userOptional = userRepo.findByEmail(rDto.getEmail());
		if (userOptional.isPresent()) 
		{
			Date currentDate = new Date();
			UserEntity user = userOptional.get();
			
				if (user.getOtp().equals(rDto.getOtp())) 
				{
					if(user.getOtpValidity().after(currentDate))
					{
//						System.out.println("in otp validity");
						user.setPassword(bcryptPasswordEncoder.encode(rDto.getPassword()));
						userRepo.save(user);
						return "Login";
					}else {
						model.addAttribute("otp", "OTP expeired | <a href='forgotpassword'>Re-Send OTP ?</a>");
					}
				}
		}
		model.addAttribute("error", "Invalid Credentials...");
		return "ChangePassword";
	}
	
	//Role
	
	@GetMapping("role")
	public String getRole()
	{
		return "AddRole";
	}
	@PostMapping("addrole")
	public String addRole(RoleEntity role) 
	{
		roleRepo.save(role);
		return "Home";
	}
	
	//industry
	@GetMapping("industry")
	public String getIndustry()
	{
		return "AddIndustry";
	}
	
	@PostMapping("addindustry")
    public String uploadCSV(@RequestParam("file") MultipartFile file) 
	{
        
			try {
	            // Read
	            Reader reader = new InputStreamReader(file.getInputStream());
	            CSVReader csvReader = new CSVReader(reader);
	
	            HashSet<String> uniqueIndustries = new HashSet<>();
	
	            //data of industry column
	            String[] nextLine;
	            int industryColumnIndex = 1;
	
	            while ((nextLine = csvReader.readNext()) != null) 
	            {
	                if (nextLine.length > industryColumnIndex) 
	                {
	                    String industryData = nextLine[industryColumnIndex];
	                    
	                    uniqueIndustries.add(industryData);
	                } else 
	                {
	                    System.out.println("Invalid row: " + String.join(",", nextLine));
	                }
	            }
	            csvReader.close();
	            
	         // Fetch existing "industry" data from the database
	            List<IndustryEntity> existingIndustries = industryRepo.findAll();
	            Set<String> existingIndustryNames = new HashSet<>();
	            for (IndustryEntity industry : existingIndustries) {
	                existingIndustryNames.add(industry.getIndustryName());
	            }
	            
	            
	            
	            
	         // Adding unique "industry" data
	            for (String industry : uniqueIndustries) {
	                if (!existingIndustryNames.contains(industry)) {
	                    IndustryEntity newIndustry = new IndustryEntity();
	                    newIndustry.setIndustryName(industry);
	                    industryRepo.save(newIndustry);
	                    System.out.println("Unique Industry Inserted: " + industry);
	                } else {
	                    System.out.println("Industry Already Exists: " + industry);
	                }
	            }
	        } catch (Exception e) 
	        {
	            e.printStackTrace();
	            
	        }

        return "Home";
    }
	
	
	@PostMapping("addindustry1")
	public String uploadCSV(IndustryEntity industries)
	{
		industryRepo.save(industries);
		return "Home";
	}
	
	@GetMapping("faqs")
	public String addFaqs()
	{
		return "AddFaqs";
	}
	
	@PostMapping("addfaqs")
	public String addFaqs(FaqsEntity faqs)
	{
		faqRepo.save(faqs);
		return "Home";
	}
	
}



