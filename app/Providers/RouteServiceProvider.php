<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;
use File;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to the "home" route for your application.
     *
     * This is used by Laravel authentication to redirect users after login.
     *
     * @var string
     */
    public const HOME = '/dashboard';

    public $domain_route_files;

    public $company_controllers_namespace = 'App\Http\Controllers\Company';

    /**
     * The controller namespace for the application.
     *
     * When present, controller route declarations will automatically be prefixed with this namespace.
     *
     * @var string|null
     */
    // protected $namespace = 'App\\Http\\Controllers';

    function scanCompanyRootFiles() {
        $files = File::allFiles( base_path('routes/company') );
        array_walk( $files, function(&$val,$key) {
            $val = $val->getPathName();
        });
        return $files;
    }

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        $this->domain_route_files = $this->scanCompanyRootFiles();

        $this->configureRateLimiting();

        $this->routes(function () {
            Route::prefix('api')
                ->middleware('api')
                ->namespace($this->company_controllers_namespace)
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->namespace($this->company_controllers_namespace)
                ->group(base_path('routes/web.php'));
        });
       $this->mapWebRoutes();
       $this->mapApiRoutes();
    }

    /**
     * Configure the rate limiters for the application.
     *
     * @return void
     */
    protected function configureRateLimiting()
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(60)->by(optional($request->user())->id ?: $request->ip());
        });
    }
    protected function mapWebRoutes()
    {
        foreach ($this->centralDomains() as $domain) {
            Route::middleware('web')
                ->domain($domain)
                ->namespace($this->company_controllers_namespace)
                ->group( function($router) {
                    foreach ($this->domain_route_files as $file) {
                        require_once($file);
                    }
                });
        }
    }

    protected function mapApiRoutes()
    {
        foreach ($this->centralDomains() as $domain) {
            Route::prefix('api')
                ->domain($domain)
                ->middleware('api')
                ->namespace($this->company_controllers_namespace)
                ->group( function($router) {
                    foreach ($this->domain_route_files as $file) {
                        require_once($file);
                    }
                });
        }
    }

    protected function centralDomains(): array
    {
        return config('tenancy.central_domains');
    }
}
