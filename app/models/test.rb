# Создайте метод класса в модели Test, который возвращает отсортированный по убыванию массив
# названий всех Тестов у которых Категория называется определённым образом
# название категории передается в метод в качестве аргумента).

class Test < ApplicationRecord
  def self.sort_by_category(category)
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id")
        .where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
