package Conecta;

import java.sql.Connection;
import java.sql.DriverManager;

public class RenzoConnection {

    private static Connection cn;

    public static Connection getConnection() {
        try {
            // Cargar el driver JDBC para SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Datos de conexión
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Conectar";
            String user = "sa";
            String password = "DeadShot2104";

            // Intentar la conexión
            cn = DriverManager.getConnection(url, user, password);
            System.out.println("✅ Conexión establecida con SQL Server");
        } catch (Exception e) {
            System.out.println("❌ Error al conectar a SQL Server:");
            e.printStackTrace();  // imprime el error completo
            cn = null;
        }
        return cn;
    }

    public static void main(String[] args) {
        Connection pruebaCn = RenzoConnection.getConnection();
        if (pruebaCn != null) {
            System.out.println("✅ Conectado");
            System.out.println(pruebaCn);
        } else {
            System.out.println("❌ Desconectado");
        }
    }
}

