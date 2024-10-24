/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dal.DBContext;
import model.Categories;
import model.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Accounts;

/**
 *
 * @author trinh
 */
public class DAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String query = "select * from products";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Products> getAllProductsByCategories(String cid) {
        List<Products> list = new ArrayList<>();
        String query = "select * from products where cateID=?";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Products> searchByName(String txtSearch) {
        List<Products> list = new ArrayList<>();
        String query = "select * from products where name like ?";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Products getAllProductsByIDCategories(String id) {
        List<Products> list = new ArrayList<>();
        String query = "select * from products where id = ?";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                 return new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
       return null;
    }

    public List<Categories> getAllCategories() {
        List<Categories> list = new ArrayList<>();
        String query = "select * from Categories";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Products getLast() {
        String query = "select top 1 * from products\n"
                + "order by id desc";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }
  public Accounts login(String user, String pass){
      String query = "select * from accounts where [user] = ? and pass =?";
      try{
          con = new DBContext().getConnection();
          ps=con.prepareStatement(query);
          ps.setString(1,user);
          ps.setString(2, pass);
          rs = ps.executeQuery();
          while(rs.next()){
              return  new Accounts(rs.getInt(1),
                      rs.getString(2),
                      rs.getString(3),
                      rs.getInt(4), 
                      rs.getInt(5));
          }
      }catch(Exception e){
          
      }
      return null;
  }
  public Accounts checkAccountExist(String user){
      String query = "select * from accounts where [user] = ?";
      try{
          con = new DBContext().getConnection();
          ps=con.prepareStatement(query);
          ps.setString(1,user);
          
          rs = ps.executeQuery();
          while(rs.next()){
              return  new Accounts(rs.getInt(1),
                      rs.getString(2),
                      rs.getString(3),
                      rs.getInt(4), 
                      rs.getInt(5));
          }
      }catch(Exception e){
          
      }
      return null;
  }
  public void singup(String user, String pass){
      String query="insert into accounts values(?,?,0,0)";
      try{
             con = new DBContext().getConnection();
          ps=con.prepareStatement(query);
          ps.setString(1,user);
          ps.setString(2,pass);
          ps.executeUpdate();
      }catch(Exception e){
          
      }
  }
    public static void main(String[] args) {
        DAO dao = new DAO();
        
        List<Categories> listC = dao.getAllCategories();
        List<Products> list = dao.getAllProductsByCategories("cid");

        for (Categories o : listC) {
            System.out.println(o);
        }
    }

}
