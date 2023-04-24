using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppGenerator
{
    internal class Utility
    {
        public static void createFile(string path, string text)
        {
            DirectoryInfo di = Directory.CreateDirectory(@"../temp/");
            DirectoryInfo di1 = Directory.CreateDirectory(@"../temp/FrontModel");
            DirectoryInfo di8 = Directory.CreateDirectory(@"../temp/Security");
            DirectoryInfo di2 = Directory.CreateDirectory(@"../temp/Model");
            DirectoryInfo di3 = Directory.CreateDirectory(@"../temp/Controllers");
            DirectoryInfo di4 = Directory.CreateDirectory(@"../temp/Views");
            DirectoryInfo di7 = Directory.CreateDirectory(@"../temp/Pages");
            DirectoryInfo di5 = Directory.CreateDirectory(@"../temp/PagesViews");
            DirectoryInfo di6 = Directory.CreateDirectory(@"../temp/PagesCatalogos");
            // Create the file, or overwrite if the file exists.
            using (FileStream fs = File.Create(path))
            {
                byte[] info = new UTF8Encoding(true).GetBytes(text);
                // Add some information to the file.
                fs.Write(info, 0, info.Length);
            }

            // Open the stream and read it back.
            using (StreamReader sr = File.OpenText(path))
            {
                string s = "";
                while ((s = sr.ReadLine()) != null)
                {
                    Console.WriteLine(s);
                }
            }
        }

    }
}
