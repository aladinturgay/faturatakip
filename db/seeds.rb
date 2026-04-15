
# Kullanıcıları idempotent şekilde oluştur
admin = User.find_or_create_by!(email: 'admin@example.com') do |u|
  u.password = 'password'
  u.role = 'admin'
end
customer1 = User.find_or_create_by!(email: 'ali@example.com') do |u|
  u.password = 'password'
  u.role = 'customer'
end
customer2 = User.find_or_create_by!(email: 'ayse@example.com') do |u|
  u.password = 'password'
  u.role = 'customer'
end
customer3 = User.find_or_create_by!(email: 'mehmet@example.com') do |u|
  u.password = 'password'
  u.role = 'customer'
end
customer4 = User.find_or_create_by!(email: 'zeynep@example.com') do |u|
  u.password = 'password'
  u.role = 'customer'
end

# Abonelikleri idempotent şekilde oluştur
subs = []
subs << Subscription.find_or_create_by!(user: customer1, name: 'Süper Paket') do |s|
  s.status = 'active'
  s.start_date = Date.today - 30
  s.end_date = Date.today + 335
end
subs << Subscription.find_or_create_by!(user: customer1, name: 'Ekstra Paket') do |s|
  s.status = 'inactive'
  s.start_date = Date.today - 400
  s.end_date = Date.today - 35
end
subs << Subscription.find_or_create_by!(user: customer2, name: 'Genç Paket') do |s|
  s.status = 'active'
  s.start_date = Date.today - 10
  s.end_date = Date.today + 355
end
subs << Subscription.find_or_create_by!(user: customer3, name: 'Aile Paketi') do |s|
  s.status = 'active'
  s.start_date = Date.today - 60
  s.end_date = Date.today + 305
end
subs << Subscription.find_or_create_by!(user: customer4, name: 'Kurumsal Paket') do |s|
  s.status = 'active'
  s.start_date = Date.today - 90
  s.end_date = Date.today + 275
end

# Faturaları sadece yoksa oluştur
subs.each_with_index do |sub, i|
  3.times do |j|
    issued = Date.today - (j*30 + i*10)
    due = issued + 10
    unless Invoice.exists?(user: sub.user, subscription: sub, issued_at: issued)
      Invoice.create!(user: sub.user, subscription: sub, amount: rand(80..250), status: j.even? ? 'paid' : 'unpaid', issued_at: issued, due_at: due)
    end
  end
end
