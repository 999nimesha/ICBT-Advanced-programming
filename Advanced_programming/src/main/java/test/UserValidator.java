package test;

public class UserValidator {
	// Check if password and re-password match
    public static boolean isPasswordMatching(String password, String rePassword) {
        return password != null && password.equals(rePassword);
    }
}
