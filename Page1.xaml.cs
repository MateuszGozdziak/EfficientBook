using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for Page1.xaml
    /// </summary>
    public partial class Page1 : Page
    {
        public Page1()
        {
            InitializeComponent();

            string connStr = "server=localhost;user=root;database=projektprogramowaniezaawansowane;port=3306;password=";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                //List<string>[] list = new List<string>[3];
                //list[0] = new List<string>();
                //list[1] = new List<string>();
                //list[2] = new List<string>();

                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT * FROM produkty";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader reader = cmd.ExecuteReader();

                List<string> ListBox_list_of_ID = new List<string>(); 
                List<string> ListBox_list_of_Nazwa = new List<string>();
                List<string> ListBox_list_of_Ilosc_dostepnych = new List<string>();
                List<string> ListBox_list_of_Cenabrutto = new List<string>();
                List<string> ListBox_list_of_Cenanetto = new List<string>();
                List<string> ListBox_list_of_Kod = new List<string>();
                List<string> ListBox_list_of_Marka = new List<string>(); 
                List<string> ListBox_list_of_VAT = new List<string>();
                Console.WriteLine();


                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        ListBox_list_of_ID.Add(reader.GetInt32(0).ToString());
                        ListBox_list_of_Nazwa.Add(reader.GetString(1).ToString());
                        ListBox_list_of_Ilosc_dostepnych.Add(reader.GetInt32(2).ToString());
                        ListBox_list_of_Cenabrutto.Add(reader.GetInt32(3).ToString());
                        ListBox_list_of_Cenanetto.Add(reader.GetInt32(4).ToString());
                        ListBox_list_of_Kod.Add(reader.GetString(5).ToString());
                        ListBox_list_of_Marka.Add(reader.GetString(6).ToString());
                        ListBox_list_of_VAT.Add(reader.GetInt32(7).ToString());
                        Console.WriteLine();

                    }
                    ListBox_ID.ItemsSource = ListBox_list_of_ID;
                    ListBox_Cenabrutto.ItemsSource = ListBox_list_of_Cenabrutto;
                    ListBox_Cenanetto.ItemsSource = ListBox_list_of_Cenanetto;
                    ListBox_Ilosc_dostepnych.ItemsSource = ListBox_list_of_Ilosc_dostepnych;
                    ListBox_Kod.ItemsSource = ListBox_list_of_Kod;
                    ListBox_VAT.ItemsSource = ListBox_list_of_VAT;
                    ListBox_Nazwa.ItemsSource = ListBox_list_of_Nazwa;
                    ListBox_Marka.ItemsSource = ListBox_list_of_Marka;


                }
                else
                {
                    Console.WriteLine("No rows found.");
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                MessageBox.Show(ex.ToString());
            }

            conn.Close();
            Console.WriteLine("Done.");
        }
    }
}
