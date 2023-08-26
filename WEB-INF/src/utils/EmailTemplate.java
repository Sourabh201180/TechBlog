package utils;

public class EmailTemplate {
    public static String getSignupSuccessMessage(String name, String email, String otp) {
        String message = "<h2>Hello "+name+"</h2>"+
                         "<h1>Welcome to TechBlog,</h1>"+
                         "<H3>Your Account is created...</H3>"+
                         "<H3>You are now be the part of our TechBlog Community...</H3>"+
                         "<p>Click over the link to activate your account:"+
                         " <a href='http://localhost:8080/TechBlog/verify_email.do?email="+email+"&otp="+otp+"'>Activation Link</a></p>";

        return message;
    }
}