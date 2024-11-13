package aiwa.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import aiwa.entity.Item;

public class ItemModel {

	public Item findById(ServletContext context, int itemId) {

		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/webapp13.db"));
			String sql = "select*from items where itemid=?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, itemId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("itemid"));
				item.setItemName(rs.getString("itemname"));
				item.setPrice(rs.getInt("price"));
				item.setImage(rs.getString("image"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getInt("rating"));

				conn.close();
				return item;

			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

	public ArrayList<Item> fineBykeyword(ServletContext context, String word) {

		ArrayList<Item> result = new ArrayList<>();

		try {

			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/webapp13.db"));

			String sql = "select * from items where itemname like ? or detail like ?";

			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setString(1, "%" + word + "%");

			stmt.setString(2, "%" + word + "%");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("itemid"));
				item.setItemName(rs.getString("itemname"));
				item.setPrice(rs.getInt("price"));
				item.setImage(rs.getString("image"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getInt("rating"));
				result.add(item);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return result;

	}

}
