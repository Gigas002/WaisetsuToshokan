using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

namespace WaisetsuToshokan;

// Set launchSettings.json -> environmentVariables -> "ASPNETCORE_URLS": "http://*:5000" for local testing,
// since dotnet blazor server only listens to localhost by default.
// Use http://192.168.221.67:5000 to connect from another device for testing

public static class Program
{
    public static async Task Main(string[] args)
    {
        var builder = WebAssemblyHostBuilder.CreateDefault(args);
        builder.RootComponents.Add<App>("#app");
        builder.RootComponents.Add<HeadOutlet>("head::after");
        
        builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

        await builder.Build().RunAsync();
    }
}