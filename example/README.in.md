# Example setup

```toml
@include "parts/00.toml"
```

```toml
@include "parts/10.base.toml"
```

```toml
@include "parts/20.site.toml"
```

```toml
@include "parts/21.site.patch.doas.toml"
```

```toml
@include "parts/22.site.patch.ntpd.toml"
```

```toml
@include "parts/23.site.patch.nginx.toml"
```

```toml
@include "parts/24.site.patch.echoip.toml"
```

```toml
@include "parts/30.run.toml"
```

```toml
@include "parts/40.aws.ami.toml"
```

```toml
@include "parts/41.aws.terraform.toml"
```
