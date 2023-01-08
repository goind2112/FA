//
//  InfoFisicalActiviti.swift
//  FA
//
//  Created by Даниил Мухсинятов on 16.06.2022.
//

import SwiftUI

struct InfoListPhysicalActivity: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text ("Назад")
                    .foregroundColor(.gray)
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(5)
            ScrollView {
                VStack {
                    Text ("Что мне выбрать?")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                    VStack {
                        Text ("""
                  Для расчета калорий в приложении используется формула Миффлина – Сан – Жеора, указанная формула учитывает физическую активность, исходя из которой к результату прошлых исчислений ((10 * Вес в килограммах) + (6,25 * рост в сантиметрах) – (5 * возраст в годах) для мужчин к результату нужно прибавить 5, а для женщин отнять от результата 161) добавляется коэффициент.
                  """)
                        .font(.system(size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background()
                        .cornerRadius(15)
                    }
                    .padding(10)
                }
                VStack {
                    Text ("Коэффициент 1,2")
                        .font(.system(size: 20))
                    
                    Text ("""
Минимум/отсутствие – выберете если у вас нет физических нагрузок и сидячая работа
""")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                }
                .background()
                .cornerRadius(15)
                .padding(10)
                
                VStack {
                    Text ("Коэффициент 1,375")
                        .font(.system(size: 20))
                    
                    Text ("""
Слабая активность - выберете если вы 1 - 3 раза в неделю находите время на незначительную физическую активность.

Например:
A) легкая пробежка
B) зарядка
C) небольшая физическая активность на работе
""")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                }
                .background()
                .cornerRadius(15)
                .padding(10)
                
                VStack {
                    Text ("Коэффициент 1,55")
                        .font(.system(size: 20))
                    
                    Text ("""
Средняя активность – выберете если вы занимаетесь спортом 3 - 5 раз в неделю.

Например:
1) посещаете спорт зал для поддержания формы делаете 1 или 2 подхода на все группы мышц
2) работа с нагрузкой эквивалентной указанному выше
""")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                }
                .background()
                .cornerRadius(15)
                .padding(10)
                
                VStack {
                    Text ("Коэффициент 1,725")
                        .font(.system(size: 20))
                    
                    Text ("""
Высокая активность – выберете если вы занимаетесь спортом 3 - 5 раз в неделю интенсивно.

Например:
1) посещаете спорт зал тренируетесь с полноценной нагрузкой 3-4 подхода, один день одна группа мышц или сплиты
2) работа с нагрузкой эквивалентной указанному выше
""")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                }
                .background()
                .cornerRadius(15)
                .padding(10)
                
                VStack {
                    Text ("Коэффициент 1,9")
                        .font(.system(size: 20))
                    
                    Text ("""
Очень высокая активность – выберете если вы занимаетесь спортом 5 - 7 раз в неделю интенсивно.

Например:
A) интенсивные физические нагрузки + физические нагрузки на работе
B) вы профессиональный спортсмен
""")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                }
                .background()
                .cornerRadius(15)
                .padding(10)
                
            }
        }
        .background(Color.offWhite)
    }
}

struct InfoListPhysicalActivity_Previews: PreviewProvider {
    static var previews: some View {
        InfoListPhysicalActivity()
    }
}
