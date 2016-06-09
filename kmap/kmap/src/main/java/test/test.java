package test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.junit.runner.*;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.mail.internet.MimeMessage;

import java.io.File;

/**
 * Created by Mtime on 2015/9/17.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mvc.xml")
public class test {

//    @Autowired
//    @Qualifier("APIAcademyService")
//    private APIAcademyService apiAcademyService;

    private static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(test.class);

    @Autowired
    private JavaMailSenderImpl javaMailSender;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Test
    public void sendMailTest(){

        try {
            MimeMessage mailMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true);
            messageHelper.setFrom("Echo_rejoice@163.com");
            messageHelper.setTo("1126323106@qq.com");

            messageHelper.setSubject("测试邮件中嵌套图片!！");
            // true 表示启动HTML格式的邮件
            messageHelper.setText(
                    "<html><head></head><body><h1>hello!!spring image html mail</h1>"
                            +"<a href=http://www.baidu.com>baidu</a>"+ "<img src=cid:image/>"
                    +"<img src=cid:test/></body></html>", true);

            FileSystemResource img = new FileSystemResource(new File("/Users/apple/desktop/IMG_0735.jpg"));
            messageHelper.addInline("image", img);//跟cid一致
            FileSystemResource image2 = new FileSystemResource(new File("/Users/apple/desktop/IMG_0013.jpg"));
            messageHelper.addInline("test",image2);

            javaMailSender.send(mailMessage);
            System.out.println("邮件发送成功...");

        }catch (Exception ex){

        }

    }

    @Test
    public void sqlTest(){
        ClassPathXmlApplicationContext classPathXmlApplicationContext=new ClassPathXmlApplicationContext("classpath:spring-mvc.xml");
        System.out.print(classPathXmlApplicationContext.getApplicationName());

    }
}
