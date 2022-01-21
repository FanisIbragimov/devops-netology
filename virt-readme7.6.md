**Задание №1**    
1. Datasource находится в файле [provider.go](https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/provider/provider.go#L346-L738) в строках 346-738.   
Resource находятся также в  файле [provider.go](https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/provider/provider.go#L741-L1780) в строках 741-1780.   
   
**Задание №2**    
1. Параметр **name** конфликтует с параметром **name_prefix** в следующем файле [queue.go](https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/service/sqs/queue.go#L82-L94)
```
		"name": {
			Type:          schema.TypeString,
			Optional:      true,
			Computed:      true,
			ForceNew:      true,
			ConflictsWith: []string{"name_prefix"},
		},
		"name_prefix": {
			Type:          schema.TypeString,
			Optional:      true,
			Computed:      true,
			ForceNew:      true,
			ConflictsWith: []string{"name"},
  ```   
      
      
2. Максимальная длина параметра name не установлена.
3. Предположу. что name должно подчиняться регулярному выражению .?
