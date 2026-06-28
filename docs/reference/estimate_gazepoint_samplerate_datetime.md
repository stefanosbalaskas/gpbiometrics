# Estimate sampling rate from datetime stamps

Estimate sampling rate from datetime stamps

## Usage

``` r
estimate_gazepoint_samplerate_datetime(
  datetime,
  format = NULL,
  tz = "UTC",
  robust = TRUE
)
```

## Arguments

- datetime:

  POSIXct, POSIXlt, Date, or character timestamps.

- format:

  Optional datetime format for character input.

- tz:

  Time zone used when parsing character input.

- robust:

  If TRUE, use the median interval.

## Value

Estimated sampling-rate information.
