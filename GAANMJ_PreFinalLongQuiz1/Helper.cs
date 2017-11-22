using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace GAANMJ_PreFinalLongQuiz1.AppCode
{
    public class Helper
    {
        public static string GetCon()
        {
            return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
        }
    }
}