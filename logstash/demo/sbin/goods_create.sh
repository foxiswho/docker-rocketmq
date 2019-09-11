#!/bin/bash

echo "start Create goods"
echo "\n"

curl -H "Content-Type: application/json" -XPUT "http://127.0.0.1:9200/goods" -d '{
    "settings" : {
        "analysis": {
            "filter": {
                "jt_tfr": {
                    "type": "stop",
                    "stopwords": [" "]
                  },
                  "local_synonym_filter": {
                    "type": "synonym",
                    "synonyms_path": "synonyms.txt"
                  },
                  "english_stop": {
                      "type":       "stop",
                      "stopwords":  "_english_"
                    },
                    "english_keywords": {
                      "type":       "keyword_marker",
                      "keywords":   ["example"]
                    },
                    "english_stemmer": {
                      "type":       "stemmer",
                      "language":   "english"
                    },
                    "english_possessive_stemmer": {
                      "type":       "stemmer",
                      "language":   "possessive_english"
                    }
            },
            "char_filter": {
                "jt_cfr": {
                    "type": "mapping",
                    "mappings": [
                        "| => \\|"
                    ]
                }
            },
            "analyzer": {
              "ik_syno_max": {
                "type":"custom",
                "tokenizer": "ik_max_word",
                "filter": ["local_synonym_filter","jt_tfr","stemmer"],
                 "char_filter": ["jt_cfr"]
              },
              "ik_syno_smart": {
                "type":"custom",
                "tokenizer": "ik_smart",
                "filter": ["local_synonym_filter","stemmer"]
              },
              "english": {
                  "tokenizer":  "standard",
                  "filter": [
                    "english_possessive_stemmer",
                    "lowercase",
                    "english_stop",
                    "english_keywords",
                    "english_stemmer"
                  ]
                }
            }
          }
    },
    "mappings" : {
        "_doc" : {
            "dynamic" : true,
            "properties" : {
                "title" : {
                    "type" : "text",
                    "analyzer" : "ik_syno_max",
                    "search_analyzer": "ik_syno_max"
			,"fields": {
		            "cn": {
		              "type": "text",
		              "analyzer": "ik_syno_max"
		            },
		            "en": {
		              "type": "text",
		              "analyzer": "english"
		            }
		          }
                },
                "title_all" : {
                    "type" : "text",
                    "analyzer" : "ik_syno_max",
                    "search_analyzer": "ik_syno_max"
		   ,"fields": {
		            "cn": {
		              "type": "text",
		              "analyzer": "ik_syno_max"
		            },
		            "en": {
		              "type": "text",
		              "analyzer": "english"
		            }
		          }
                }
            }
        }
    }
}'


echo  "\n"

echo "SUCCESS"
