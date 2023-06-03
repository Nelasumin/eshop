package cn.edu.edu.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class DBUtil {
	private static Connection con = null;// ���Ӷ���
	private static PreparedStatement pstmt = null;// ������

	private static ResultSet rs = null;// ���������
	//private static String datasourceName = Const.DATA_SOURCE;// ����Դ����
	public DBUtil() {
	}

	public static Connection getConn() {
		return con;
	}

	public static void setConn(Connection con) {
		con = con;
	}
	
	   //�������ݿ�
	public static Connection getCon(){
	
    //******************************************************************************************************
	//*************change url and class name*********************
	//String url = "jdbc:mysql://localhost:3306/eshop?useUnicode=true&amp;characterEncoding=UTF-8";
    String url = "jdbc:mysql://localhost:3306/eshop?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf8";
    //String url = "jdbc:mysql://localhost:3306/eshop?useUnicode=true&characterEncoding=utf8";
    //String url = "jdbc:mysql://localhost:3306/eshop?useUnicode=true&characterEncoding=GBK";
	String user = "root";
	String password = "root";

		try {
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
		// ��ȡ������
		private static PreparedStatement getPrepareStatement(String sql)
				throws Exception {
			if(con==null||con.isClosed())
				pstmt = getCon().prepareStatement(sql);
			else
				pstmt = con.prepareStatement(sql);
			return pstmt;
		}
		// �����������飬�������е�ֵ��λ��һһ��Ӧ�ض�pstmt�������SQL����еĲ�����������
		private static void setParams(String sql, Object[] params) throws Exception {
			pstmt = getPrepareStatement(sql);
			for (int i = 0; i < params.length; i++)
				pstmt.setObject(i + 1, params[i]);
		}

		// �ӽ�����еõ�һ������
		private static Object getObjectFromRS(String sql, Object[] params)
				throws Exception {
			Object o = null;
			setParams(sql, params);// ����sql����params������pstmt����
			rs = pstmt.executeQuery();
			if (rs.next())
				o = rs.getObject(1);
			return o;
		}
		// ��������з�װ��һ��List
		private static List getListFromRS() throws Exception {
			List list = new ArrayList();
			// ��ȡԪ����
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {
				Map m = new HashMap();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					// ��ȡ��ǰ�е�i�е���������
					String colType = rsmd.getColumnTypeName(i);
					// ��ȡ��ǰ�е�i�е�����
					String colName = rsmd.getColumnName(i).toLowerCase();
					String s = rs.getString(colName);
					if (s != null) {
						//System.out.println(colType+colName);
						if (colType.equals("INTEGER")||colType.equals("INT"))
							m.put(colName, new Integer(rs.getInt(colName)));
						else if (colType.equals("FLOAT"))
							m.put(colName, new Float(rs.getFloat(colName)));
						else{
							// �������;���ΪString����ȡ��
							m.put(colName, rs.getString(colName));
							//System.out.println("==="+m);
						}

					}
				}
				list.add(m);
			}
			return list;
		}

		// ��ҳ��ʾ����ȡҳ��ΪcurPage�ı�ҳ���м�¼
		// ���ص�Map�����д������Ԫ�أ�
		// key="list"��Ԫ���Ǵ���˱�ҳ���м�¼��List����
		// key="totalPage"��Ԫ���Ǵ�����ҳ����Long����
//		public static Map getPage(String sql, Object[] params, String curPage) {
//			String s_page_rec_num = Const.PAGE_REC_NUM;
//			int i_page_rec_num = Integer.parseInt(s_page_rec_num);
//			Map page = new HashMap();
//			try {
//				String newSql = sql + " limit " + (Integer.parseInt(curPage) - 1)
//						* i_page_rec_num + "," + i_page_rec_num;
//				List pagingList = getList(newSql, params);// ����RS�õ�list
//				close();
//
//				// ������ҳ��			
//				sql = sql.toLowerCase();
//				String countSql="";
//				if(sql.indexOf("group")>=0)
//					countSql = "select count(*) as num from ("+sql+") as temp";
//				else
//					countSql = "select count(*) as num from (" +sql+") as temp";
//						//+ sql.substring(sql.indexOf("from"));
//				System.out.println(countSql);
//				// count�д���ܼ�¼�� 
//				long count= getLong(countSql, params);
//				
//				System.out.println("count:" + count);
//
//				// �����ܼ�¼����count����ÿҳ��¼������Const.PAGE_REC_NUM��������ҳ��
//				long totalPage = 0;
//				if (count % i_page_rec_num == 0)
//					totalPage = count / i_page_rec_num;
//				else
//					totalPage = count / i_page_rec_num + 1;
//
//				// ���ص�List����page�У��±�Ϊ0��Ԫ��Ϊ��ŵ�ǰ��ҳ���м�¼��List����pagingList���±�Ϊ1��Ԫ��Ϊ��ҳ��
//				page.put("list", pagingList);
//				page.put("totalPage", new Long(totalPage));
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				close();
//			}
//			return page;
//		}

//		public static Map getPage(String sql, String curPage) {
//			return getPage(sql, new Object[] {}, curPage);
//		}

		// ��ѯ��ȡList����
		public static List getList(String sql, Object[] params) {
			List list = null;// ���屣���ѯ����ļ��϶���
			try {
				setParams(sql, params);// ����sql����params������pstmt����
				rs = pstmt.executeQuery();// ִ��SQL��䣬�õ������
				list = getListFromRS();// ����RS�õ�list
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs,pstmt,con);
			}
			return list;
		}

		public static List getList(String sql) {
			return getList(sql, new Object[] {});
		}

		// ��ѯ��ȡMap����
		public static Map getMap(String sql, Object[] params) {
			Map m = null;
			try {
				setParams(sql, params);// ����sql����params������pstmt����
				rs = pstmt.executeQuery();
				List l = getListFromRS();
				if (l != null && l.size()!=0)
					m = (Map) (l.get(0));// ����RS�õ�Map

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs,pstmt,con);
			}
			return m;
		}

		public static Map getMap(String sql) {
			return getMap(sql, new Object[] {});
		}

		// ��ѯ���long����
		public static long getLong(String sql, Object[] params) {
			long l = 0;
			try {
				Object temp = getObjectFromRS(sql, params);
				if(temp!=null)
					l = ((Long)temp).longValue();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs,pstmt,con);
			}
			return l;
		}

		// ��ѯ���int����
		public static int getInt(String sql, Object[] params) {
			int i = 0;
			try {
				Object temp = getObjectFromRS(sql, params);
				if(temp!=null)
					i = ((Integer)temp).intValue();
			} catch (Exception e) {
				e.printStackTrace();
			} finally { 
				close(rs,pstmt,con);
			}
			return i;
		}

		public static int getInt(String sql) {
			return getInt(sql, new Object[] {});
		}

		// ��ѯ���String����
		public static String getString(String sql, Object[] params) {
			String str = null;
			try {
				Object temp = getObjectFromRS(sql, params);
				if(temp!=null)
					str = (String)temp;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs,pstmt,con);
			}
			return str;
		}

		public static String getString(String sql) {
			return getString(sql, new Object[] {});
		}

		// ���ӡ��޸ĺ�ɾ�������Ե���update����
		public static int update(String sql, Object[] params) {
			int recNo = 0;// ��ʾ��Ӱ��ļ�¼����
			try {
				setParams(sql, params);// ����sql����params������pstmt����
				recNo = pstmt.executeUpdate();// ִ�и��²���
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs,pstmt,con);
			}
			return recNo;
		}

		public static int update(String sql) {
			return update(sql, new Object[] {});
		}

		// ��Ҫ����������ӡ��޸ĺ�ɾ�������Ե���updateTA����
		public static int updateTA(String sql, Object[] params) throws Exception {
			int recNo = 0;// ��ʾ��Ӱ��ļ�¼����
			
			setParams(sql, params);// ����sql����params������pstmt����
			recNo = pstmt.executeUpdate();// ִ�и��²���
			
			return recNo;
		}

		public static int updateTA(String sql) throws Exception {
			return updateTA(sql, new Object[] {});
		}

		// ��Map����ת��ΪObject����
		public static Object[] getObjectArrayFromMap(Map map, String key) {
			String[] keys = key.split(",");
			Object[] tmp = new Object[keys.length];
			for (int i = 0; i < keys.length; i++) {
				tmp[i] = map.get(keys[i].trim());
			}
			return tmp;
		}

	//�ر����ݿ�
	public static void close(ResultSet rs,PreparedStatement ps,Connection con){
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
}


