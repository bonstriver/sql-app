CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_email VARCHAR(50),
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  bio VARCHAR(500)
);

CREATE TABLE ingredients (
  ingredient_id SERIAL PRIMARY KEY,
  ingredient_name VARCHAR(20) NOT NULL,
  food_type VARCHAR(20) NOT NULL,
  ingredient_image VARCHAR(2000)
);

CREATE TABLE recipes (
  recipe_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  recipe_name VARCHAR(50) NOT NULL,
  recipe_ingredients INTEGER NOT NULL REFERENCES ingredients(ingredient_id),
  recipe_description VARCHAR(500),
  recipe_picture VARCHAR(2000),
  is_private BOOLEAN NOT NULL,
  occasion_id VARCHAR(50)
);

CREATE TABLE occasions (
  occasion_id SERIAL PRIMARY KEY,
  occasion_name VARCHAR(100),
  recipes INT NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE individual_recipes (
  ind_recipe_id SERIAL PRIMARY KEY,
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
  recipe_name VARCHAR(50),
  user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE grocery_list (
  grocery_list_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  ingredients_id INT NOT NULL REFERENCES ingredients(ingredient_id)
);