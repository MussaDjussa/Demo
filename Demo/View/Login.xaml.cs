using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

namespace Demo.View
{
    /// <summary>
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Page
    {
        /// <summary>
        /// Инициализация страницы
        /// </summary>
        public Login()
        {
            InitializeComponent();
        }
        /// <summary>
        /// Проверка ввода на посторонние символы LoginBox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void LoginBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (Regex.IsMatch(LoginBox.Text, "[^A-z]"))
            {
                LoginBox.Text = LoginBox.Text.Remove(LoginBox.Text.Length - 1);
                LoginBox.SelectionStart = LoginBox.Text.Length;

                MessageBox.Show("Возможен только ввод латинских символов");
            }
        }
        /// <summary>
        /// Кнопка навигации к странице с регистрацией
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Registration());
        }
        /// <summary>
        /// Проверка ввода на посторонние символы PasswordBox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void PasswordBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (Regex.IsMatch(PasswordBox.Text, "[^A-z]"))
            {
                PasswordBox.Text = PasswordBox.Text.Remove(PasswordBox.Text.Length - 1);
                PasswordBox.SelectionStart = PasswordBox.Text.Length;

                MessageBox.Show("Возможен только ввод латинских символов");
            }
        }

        private void loginBtn_Click(object sender, RoutedEventArgs e)
        {
            var result = App.db.Entity(q=>q.Login == LoginBox.Text && q.Password == PasswordBox.Text);

            if(result != null)
            {
                switch(result.RoleId)
                {
                    case 1:
                        break;

                    case 2:
                        break;

                }
            }
        }
    }
}


