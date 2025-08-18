package test;

import static org.junit.Assert.*;
import org.junit.Test;
import test.UserValidator;
import com.insert.dao.User_registrationDao;

public class UserRegistrationGreenTest {

    // ✅ Test: Passwords should match (PASS)
    @Test
    public void testPasswordMatch() {
        String pass = "mypassword123";
        String rePass = "mypassword123";
        assertTrue("Passwords should match", UserValidator.isPasswordMatching(pass, rePass));
    }

    // ✅ Test: Username does NOT exist in DB (PASS if username is unique)
    @Test
    public void testUsernameNotExists() throws Exception {
        User_registrationDao dao = new User_registrationDao();
        String username = "uniqueUser_987654"; // make sure this is NOT in my DB
        assertFalse("Username should not exist in DB", dao.isUsernameExists(username));
    }
}


