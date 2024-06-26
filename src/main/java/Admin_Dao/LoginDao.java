package Admin_Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import Admin_Model.AD_Account;
import Util.HandleException;
import Util.JDBCUtil;

public class LoginDao {

    public AD_Account onLogin(AD_Account loginData) throws ClassNotFoundException {
        AD_Account account = new AD_Account();
//        if(loginData.getRole() != null )
//        {
//            if(loginData.getRole().equals("Admin"))
//            {
//                account.setUsername("admin");
//                account.setPassword("ZAP");
//                account.setRole("Admin");
//            } else if (loginData.getRole().equals("QL")) {
//                account.setUsername("ql");
//                account.setPassword("ZAP");
//                account.setRole("QL");
//
//            } else if (loginData.getRole().equals("GV")) {
//                account.setUsername("user3");
//                account.setPassword("ZAP");
//                account.setRole("GV");
//            }
//
//        }


        try {

            Connection conn = JDBCUtil.getConnection();


            PreparedStatement preparedStatement = conn
                    .prepareStatement("select * from TaiKhoan where username = ? and password = ? and role= ? ");
            preparedStatement.setString(1, loginData.getUsername());
            preparedStatement.setString(2, loginData.getPassword());
            preparedStatement.setString(3, loginData.getRole());
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {

                account = new AD_Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setRole(rs.getString("role"));

            }

        } catch (SQLException e) {

        	HandleException.printSQLException(e);
        }
        return account;                           
    }
  

	  
}
