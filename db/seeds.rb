admin = User.create!(email: 'admin@example.com', password: 'password', role: 'admin')
customer1 = User.create!(email: 'ali@example.com', password: 'password', role: 'customer')
customer2 = User.create!(email: 'ayse@example.com', password: 'password', role: 'customer')
customer3 = User.create!(email: 'mehmet@example.com', password: 'password', role: 'customer')
customer4 = User.create!(email: 'zeynep@example.com', password: 'password', role: 'customer')
admin = User.create!(email: 'admin@example.com', password: 'password', role: 'admin')
customer1 = User.create!(email: 'ali@example.com', password: 'password', role: 'customer')
customer2 = User.create!(email: 'ayse@example.com', password: 'password', role: 'customer')
customer3 = User.create!(email: 'mehmet@example.com', password: 'password', role: 'customer')
customer4 = User.create!(email: 'zeynep@example.com', password: 'password', role: 'customer')

subs = []
subs << Subscription.create!(user: customer1, name: 'Süper Paket', status: 'active', start_date: Date.today - 30, end_date: Date.today + 335)
subs << Subscription.create!(user: customer1, name: 'Ekstra Paket', status: 'inactive', start_date: Date.today - 400, end_date: Date.today - 35)
subs << Subscription.create!(user: customer2, name: 'Genç Paket', status: 'active', start_date: Date.today - 10, end_date: Date.today + 355)
subs << Subscription.create!(user: customer3, name: 'Aile Paketi', status: 'active', start_date: Date.today - 60, end_date: Date.today + 305)
subs << Subscription.create!(user: customer4, name: 'Kurumsal Paket', status: 'active', start_date: Date.today - 90, end_date: Date.today + 275)
subs = []
subs << Subscription.create!(user: customer1, name: 'Süper Paket', status: 'active', start_date: Date.today - 30, end_date: Date.today + 335)
subs << Subscription.create!(user: customer1, name: 'Ekstra Paket', status: 'inactive', start_date: Date.today - 400, end_date: Date.today - 35)
subs << Subscription.create!(user: customer2, name: 'Genç Paket', status: 'active', start_date: Date.today - 10, end_date: Date.today + 355)
subs << Subscription.create!(user: customer3, name: 'Aile Paketi', status: 'active', start_date: Date.today - 60, end_date: Date.today + 305)
subs << Subscription.create!(user: customer4, name: 'Kurumsal Paket', status: 'active', start_date: Date.today - 90, end_date: Date.today + 275)

subs.each_with_index do |sub, i|
  3.times do |j|
    Invoice.create!(user: sub.user, subscription: sub, amount: rand(80..250), status: j.even? ? 'paid' : 'unpaid', issued_at: Date.today - (j*30 + i*10), due_at: Date.today - (j*30 + i*10) + 10)
  end
end
subs.each_with_index do |sub, i|
  3.times do |j|
    Invoice.create!(user: sub.user, subscription: sub, amount: rand(80..250), status: j.even? ? 'paid' : 'unpaid', issued_at: Date.today - (j*30 + i*10), due_at: Date.today - (j*30 + i*10) + 10)
  end
end
