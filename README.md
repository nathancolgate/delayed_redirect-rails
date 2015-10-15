# delayed_redirect-rails

## Installation

The delayed_redirect files will be added to the asset pipeline and available for you to use. If they're not already in `app/assets/javascripts/application.js` by default, add these lines:

```js
//= require delayed_redirect
//= require jquery
//= require sweetalert
```

## Use

Add the `delayed-redirect` class to a link that will trigger the delayed job:

```
<a href="/big_report/trigger_generation" class="delayed-redirect">Generate the Big Report</a>
```

The response from the server should include:

```render json: { 
  success: true, 
  poll_url: your_own_custom_delayed_job_status_path(job), 
  redirect_url: your_own_custom_redirect_path(format: :pdf)
}
```

Our polling action looks like this:

```
def delayed_job_status
  job = Delayed::Job.find_by_id(params[:id])
  if job
    render json: { status: 'unfinished' }
  else
    render json: { status: 'finished' }
  end
end
```

## Customization

We try to accomodate. Use `data` attributes on the link to customize the sweetalert popup.

| Attribute                | Default                                 | Details                                                                                     |
|--------------------------|-----------------------------------------|---------------------------------------------------------------------------------------------|
| data-start-title         | "Loading..."                            |                                                                                             |
| data-start-text          | "We are generating your redirect."      |                                                                                             |
| data-start-type          | "info"                                  |                                                                                             |
| data-finish-title        | "Done"                                  |                                                                                             |
| data-finish-text         | "Your redirect is finished generating." |                                                                                             |
| data-finish-type         | "success"                               |                                                                                             |
| data-finish-button       | "Take Me There"                         |                                                                                             |
| data-finish-include-time | false                                   | Whether or not to include the amount of time it took to generate the redirect (in seconds). |


## License
delayed_redirect-rails is released under the [MIT License](MIT-LICENSE).

## Acknowledgements

This was originally Will's idea.