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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Page1 page1 = new Page1();
        Page2 page2 = new Page2();

        //

        public MainWindow()
        {
            InitializeComponent();
            //Main.NavigationService.Navigate(page1);
            //Main.NavigationService.Navigate(new Uri("Page1.xaml", UriKind.Relative));
            //Main.Navigate(page1);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Produkty(object sender, RoutedEventArgs e)
        {
            //Work_Space.Fill = new SolidColorBrush(Color.FromRgb(0, 111, 111));
            //win2.Show();
            //Page.NavigationService.Navigate(page1);
            //if(this.GetType() == typeof(Page1))
            //{
            //}
            //Page1 page1 = new Page1();

            Main.Navigate(page1);
            
            //Main.NavigationService.Navigate(new Page1());
            //Main.Content = new Page1();
            //NavigationService.Navigate(new Window1());
            //FrameWithinGrid.Navigate(new System.Uri("Page1.xaml",
            //UriKind.RelativeOrAbsolute));
            //frame
        }
        private void Button_Klienci(object sender, RoutedEventArgs e)
        {
            //Main.Navigate(page2);
            Main.NavigationService.Navigate(page2);
        }

    }
}
