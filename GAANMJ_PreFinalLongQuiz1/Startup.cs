using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GAANMJ_PreFinalLongQuiz1.Startup))]
namespace GAANMJ_PreFinalLongQuiz1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
