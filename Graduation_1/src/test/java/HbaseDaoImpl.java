

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.stereotype.Service;

public class HbaseDaoImpl  {

	/**
	 * 列的版本数为100
	 */

	public boolean create_table(final String tablename,final String info) {
		try {
			Admin admin = HbaseUtil.getConnection().getAdmin();
			TableName tableName2 = TableName.valueOf(tablename);
			HTableDescriptor tDescriptor = new HTableDescriptor(tableName2);
			if (admin.tableExists(tableName2)) {
				return false;
			} else {
				HColumnDescriptor hDescriptor = new HColumnDescriptor(info);
				hDescriptor.setMaxVersions(100);
				tDescriptor.addFamily(hDescriptor);
				admin.createTable(tDescriptor);
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}


	public boolean drop_table(final String tablename) {
		try {
			Admin admin = HbaseUtil.getConnection().getAdmin();
			TableName tableName2 = TableName.valueOf(tablename);
			if (admin.tableExists(tableName2)) {
				admin.disableTable(tableName2);
				admin.deleteTable(tableName2);
				return true;
			} 
				return false;
			
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}

	
	public List<String> get_alltable() {
		Admin admin;
		List<String> list = new ArrayList<String>();
		try {
			admin = HbaseUtil.getConnection().getAdmin();
			HTableDescriptor[] tDescriptors = admin.listTables();
			for (HTableDescriptor hTableDescriptor : tDescriptors) {
				list.add(hTableDescriptor.getNameAsString());
				System.out.println(hTableDescriptor.getNameAsString());
			}
			admin.close();
			HbaseUtil.CloseHbase();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}



	/**
	 * 主键列必须为key,暂时只支持一个列族。ArrayList里面就是放一条条的非关系型数据
	 * key,0
	 * a,1
	 * b,2
	 * c,3
	 */
	
	public void add_data_totable(ArrayList<Map<String, String>> arrayList,
			final String tablename) {
		String cf = "user_info";
		List<Put> ps = new ArrayList<Put>();
		try {
			Table table = HbaseUtil.getConnection().getTable(TableName.valueOf(tablename));
			for (Map<String, String> map : arrayList) {
				Put p = new Put(Bytes.toBytes(map.get("key")));
				map.remove("key");
				// 随机遍历Map
				Set<String> set = map.keySet();
				for (String string : set) {
					p.addColumn(Bytes.toBytes(cf), Bytes.toBytes(string),
							Bytes.toBytes(map.get(string)));
				}
				ps.add(p);
			}
            //批量插入
			table.put(ps);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
