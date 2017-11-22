using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace GAANMJ_PreFinalLongQuiz1.App_Code
{
    public class Doum
    {
        public static string GetCon()
        {
            return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
        }
    }
}