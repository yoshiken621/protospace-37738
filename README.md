users table

| Column     | Type   | Options  |
| -------------------------------|
| name       | String | NOT null |
| profile    | text   | NOT null |
| occupation | text   | NOT null |
| position   | text   | NOT null |

- has_many :prototypes
- has_many :comments


prototypes table

| Column     | Type       | Options         |
| ------------------------------------------|
| title      | String     | NOT null        |
| catch_copy | text       | NOT null        |
| concept    | text       | NOT null        |
| user       | references | NOT null 外部キー |

- belongs_to :user
- has_many :comments


comments table

| Column     | Type       | Options         |
| ------------------------------------------|
| content    | text       | NOT null        |
| prototype  | references | NOT null 外部キー |
| user       | references | NOT null 外部キー |

- belongs_to :user 
_ belongs_to :prototype