using TestAppConfig;
using Azure.Identity;
using Microsoft.Extensions.Configuration.AzureAppConfiguration;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();

// Bind configuration "TestApp:Settings" section to the Settings object
builder.Services.Configure<Settings>(builder.Configuration.GetSection("TestApp:Settings"));

builder.Services.Configure<Secrets>(builder.Configuration.GetSection("TestApp:Secrets"));


var app = builder.Build();

// Retrieve the connection string
string connectionString = builder.Configuration.GetConnectionString("AppConfig");

// Will try VS credentials
var credential = new DefaultAzureCredential();
 
// Load configuration from Azure App Configuration
builder.Configuration.AddAzureAppConfiguration(options =>
            {
                //options.Connect(connectionString)
                options.Connect(new Uri(builder.Configuration["AppConfigEndpoint"]), credential)
                        .ConfigureKeyVault(kv =>
                        {
                            kv.SetCredential(credential);
                        })
                        // Load configuration values with no label
                        .Select(KeyFilter.Any, LabelFilter.Null)
                        // Override with any configuration values specific to current hosting env
                        .Select(KeyFilter.Any, "DEV");
                        // the below should not work as I am not authorized on prod key vault
                        //.Select(KeyFilter.Any, "PROD");
            });

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
