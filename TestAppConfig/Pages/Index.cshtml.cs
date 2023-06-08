using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Options;

namespace TestAppConfig.Pages;

public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;
    public Settings Settings { get; }

    public Secrets Secrets { get; }


    public IndexModel(IOptionsSnapshot<Settings> options, IOptionsSnapshot<Secrets> secrets, ILogger<IndexModel> logger)
    {
        Settings = options.Value;
        Secrets = secrets.Value;
        _logger = logger;
    }

    public void OnGet()
    {

    }
}
