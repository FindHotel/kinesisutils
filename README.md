# Kinesis utilities

[![PyPI](https://img.shields.io/pypi/v/kinesisutils.svg?style=flat)](https://pypi.python.org/pypi/kinesisutils)


Miscellaneous utilities for [AWS Kinesis][kinesis].

[kinesis]: https://aws.amazon.com/kinesis/streams/


## Installation


```
pip install kinesisutils
```


To install the development version:

```
pip install git+https://github.com/findhotel/kinesisutils
```


## Usage

At the moment there is only one utility implemented: a Python generator that reads records from a Kinesis stream. You can use it like this:

```
import json

from kinesisutils import KinesisGenerator

# Hit Kinesis with at most 10 requests per second, usin json.loads to
# deserialize the Kinesis records (the default). You could deactivate record
# deserialization by setting des=None.
kg = KinesisGenerator("stream_name", rqs=10, des=json.loads)

for rec in kg:
    print(rec)
```

By default the generator will keep pulling records from Kinesis for 60 seconds. You can customize this timeout if you want:

```
from kinesisutils import KinesisGenerator

kg = KinesisGenerator("stream_name", timeout=30)

for rec in kg:
    print(rec)
```

## Contact

If you have questions, bug reports, suggestions, etc. please create an issue on the [GitHub project page][github]. PRs are also welcome.

[github]: http://github.com/findhotel/kinesisutils


## License

This software is licensed under the [MIT license][mit].

[mit]: http://en.wikipedia.org/wiki/MIT_License

See [License file][LICENSE].

[LICENSE]: https://github.com/findhotel/kinesisutils/blob/master/LICENSE.txt


© 2017 German Gomez-Herrero, [Find Hotel][fh] and others.

[fh]: http://company.findhotel.net
