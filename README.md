# Language detection API

Mimics the Huggingface Inference API for the language detection model [ivanlau/language-detection-fine-tuned-on-xlm-roberta-base](https://huggingface.co/ivanlau/language-detection-fine-tuned-on-xlm-roberta-base)

The model is preloaded the docker image.

## Usage

```sh
> docker run -p 8000:8000 -d ghcr.io/ccoreilly/text2lang:0.1.0
>  curl -X POST -H "Content-type: application/json" --data '{"inputs":"Jo vaig reaccionar des del primer dia contra la intolerable arbitrarietat que suposa perseguir una llengua"}' "127.0.0.1:8000/text2lang"

[[{"label":"Arabic","score":8.245650064964138e-07},{"label":"Basque","score":3.5457860576570965e-06},{"label":"Breton","score":1.8627226836542832e-06},{"label":"Catalan","score":0.9998441934585571},{"label":"Chinese_China","score":1.91025219464791e-06},{"label":"Chinese_Hongkong","score":1.0793111187012983e-06},{"label":"Chinese_Taiwan","score":6.242291874514194e-07},{"label":"Chuvash","score":8.692016422173765e-07},{"label":"Czech","score":2.192819465562934e-06},{"label":"Dhivehi","score":1.3375296248341328e-06},{"label":"Dutch","score":3.4881782084994484e-06},{"label":"English","score":2.022519993261085e-06},{"label":"Esperanto","score":1.0684777862479677e-06},{"label":"Estonian","score":6.384639732459618e-07},{"label":"French","score":3.7301720112736803e-06},{"label":"Frisian","score":7.979567158145073e-07},{"label":"Georgian","score":1.052802758749749e-06},{"label":"German","score":8.448164408036973e-07},{"label":"Greek","score":1.665433728703647e-06},{"label":"Hakha_Chin","score":1.4556193264070316e-06},{"label":"Indonesian","score":2.9045900191704277e-06},{"label":"Interlingua","score":2.7023002985515632e-05},{"label":"Italian","score":4.412924226926407e-06},{"label":"Japanese","score":2.7772518933488755e-06},{"label":"Kabyle","score":1.60937315740739e-06},{"label":"Kinyarwanda","score":1.5755953199914075e-06},{"label":"Kyrgyz","score":1.1009155969077256e-06},{"label":"Latvian","score":1.516824113423354e-06},{"label":"Maltese","score":2.2403401089832187e-06},{"label":"Mongolian","score":2.4010071228985908e-06},{"label":"Persian","score":8.083088118837622e-07},{"label":"Polish","score":2.316840891580796e-06},{"label":"Portuguese","score":1.1824969078588765e-05},{"label":"Romanian","score":3.0523619898303878e-06},{"label":"Romansh_Sursilvan","score":2.06494441954419e-05},{"label":"Russian","score":5.589186002907809e-07},{"label":"Sakha","score":9.823885420701117e-07},{"label":"Slovenian","score":1.7532637457406963e-06},{"label":"Spanish","score":2.416618008282967e-05},{"label":"Swedish","score":6.210944434315024e-07},{"label":"Tamil","score":7.816464631105191e-07},{"label":"Tatar","score":4.2421132206982293e-07},{"label":"Turkish","score":2.0509990008577006e-06},{"label":"Ukranian","score":2.744618313954561e-06},{"label":"Welsh","score":4.41204883827595e-06}]]
```
