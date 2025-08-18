package test;

import static org.junit.Assert.*;
import org.junit.Test;
import test.UserValidator;
import com.insert.dao.User_registrationDao;

public class UserRegistrationRedTest {

    // ❌ Test: Passwords should not match (FAIL on purpose if same)
    @Test
    public void testPasswordMismatch() {
        String pass = "mypassword123";
        String rePass = "mypassword123"; // intentionally same to FAIL
        assertFalse("Passwords should not match", UserValidator.isPasswordMatching(pass, rePass));
    }

    // ❌ Test: Username exists in DB but expecting it does not
    @Test
    public void testUsernameExistsButExpectingFalse() throws Exception {
        User_registrationDao dao = new User_registrationDao();
        String username = "admin"; // make sure this DOES exist in DB
        assertFalse("Forcing fail: expecting username not to exist", dao.isUsernameExists(username));
    }
}

