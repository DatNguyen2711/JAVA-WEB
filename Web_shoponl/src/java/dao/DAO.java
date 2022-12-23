package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllproduct() {
        List<Product> list = new ArrayList<>();
        String querry = "select * from product_HE161883";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;

    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String querry = "select * from Account_HE161883";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (Exception e) {
        }
        return list;

    }
    
    public String getWordbyUser(String user){
//         List<Account> acc = new ArrayList<>();
        String querry = "select secretword from Account_HE161883 where [user] = ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String querry = "select * from Category_HE161883";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {
        String querry = "Select top 1 * from Product_HE161883\n" + "order by id desc";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String querry = "select * from Product_HE161883\n" + "where cateID=?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> getProductByCIDandSellID(int cid,int sid) {
        List<Product> list = new ArrayList<>();
        String querry = "select * from Product_HE161883\n" + "where cateID=? and sell_ID = ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setInt(1, cid);
            ps.setInt(2, sid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
//    public List<Product> getProductBySellID(String sid) {
//        List<Product> list = new ArrayList<>();
//        String querry = "select * from Product_HE161883\n" + "where sell_ID=?";
//        try {
//            conn = new DBContext().getConnection();//ket noi sql sv
//            ps = conn.prepareStatement(querry);
//            ps.setString(1, sid);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6), rs.getInt(9)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }

    public Product getProductByID(String id) {
        String querry = "select * from Product_HE161883\n" + "where ID=?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String querry = "select * from Product_HE161883 where [name] like ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;

    }

    public Account login(String user, String pass) {
        String querry = "select * from Account_HE161883 where [user] = ? and pass = ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setString(1, user);
            ps.setString(2, pass);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public Account checkAccountExist(String user) {
        String querry = "select * from Account_HE161883 where [user] = ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String querry = "select * from product_HE161883 where sell_ID = ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Account getAccountByUsername(String user) {
        Account acc;
        String querry = "select * from Account_HE161883 where [user]= ?";

        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(querry);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                acc = new Account(rs.getInt(1),
                        rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteProduct(String pid) {
        String query = "delete from Product_HE161883 where id=?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    public void updatePassbyUsername(String user,String pass){
        String query="update [dbo].[Account_HE161883] set pass = ?\n"
               
                + "where [user] = ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, user);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void deleteAccount(String id) {
        String query = "delete from Account_HE161883 where uID=?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void signup(String user, String pass,String word) {
        String query = "insert into Account_HE161883 values (?,?,0,0,?)";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, word);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String image, String price, String title,
            String description, String category, String quantity, int sid) {
        String query = "INSERT [dbo].[product_HE161883] ( [name], [image], \n"
                + "[price], [title], "
                + "[description], [cateID],"
                + "[sell_ID],[quantity]) VALUES (?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(8, quantity);
            ps.setInt(7, sid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void editProduct(String name, String image, String price, String title,
            String description, String category, String quantity, String pid) {
        String query = "update [dbo].[product_HE161883] set name = ?, \n"
                + "[image] = ?,\n"
                + "price = ?, \n"
                + "title = ?,\n"
                + "description = ?, \n"
                + "cateID = ?\n" + ",quantity = ?\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//ket noi sql sv
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, quantity);
            ps.setString(8, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Product> getTop3() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from Product_HE161883";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext3Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product_HE161883 order by id offset ? rows fetch next 3 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllproduct();

//        dao.getProductByCIDandSellID(2, 20);
//       dao.updatePassbyUsername("datb","1453234");
//        System.out.println(dao.getAccountByUsername("datb"));
//        dao.signup("minh", "123");
//System.out.println(dao.getWordbyUser("aaa"));
        
    }   
}
