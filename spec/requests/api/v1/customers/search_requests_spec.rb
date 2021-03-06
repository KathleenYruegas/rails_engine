require "rails_helper"

describe "Customer Search API" do

  it 'finds single record by first name' do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first-name", params: {first_name: "#{first_name}" }

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["first_name"]).to eq(first_name)
  end

  it 'finds single record by last name' do
    last_name = create(:customer).last_name

    get '/api/v1/customers/find?last-name', params: {last_name: "#{last_name}"}

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["last_name"]).to eq(last_name)
  end

  it 'finds single record by id' do
    id = create(:customer).id

    get '/api/v1/customers/find?id', params: {id: id}

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(id)
  end

  it 'finds single record by customer created at' do
    customer = create(:customer)

    get '/api/v1/customers/find?created-at', params: {created_at: customer.created_at}

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result["id"]).to eq(customer.id)
  end

  it 'finds single record by customer updated at' do
    customer = create(:customer)

    get '/api/v1/customers/find?updated-at', params: {updated_at: customer.updated_at}

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result["id"]).to eq(customer.id)
  end

  it 'finds all records with matching first name' do
    customer_1 = create(:customer, first_name: "Bob")
    customer_2 = create(:customer, first_name: "Joe")
    customer_3 = create(:customer, first_name: "John")
    customer_4 = create(:customer, first_name: "Bob")

    get "/api/v1/customers/find_all?first_name=#{customer_1.first_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(2)
    expect(customers.first["first_name"]).to eq("Bob")
  end

  it 'finds all records with matching last name' do
    customer_1 = create(:customer, last_name: "Dylan")
    customer_2 = create(:customer, last_name: "Macha")
    customer_3 = create(:customer, last_name: "Dylan")
    customer_4 = create(:customer, last_name: "Lopez")

    get '/api/v1/customers/find_all?last_name', params: {last_name: "Dylan"}

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(2)
    expect(customers.first["last_name"]).to eq("Dylan")
  end

  it 'finds all customers by created at' do
    customer_1 = create(:customer, created_at: "2012-03-27 14:54:09 UTC")
    customer_2 = create(:customer, created_at: "2012-01-27 11:54:09 UTC")
    customer_3 = create(:customer, created_at: "2012-04-27 17:54:09 UTC")
    customer_4 = create(:customer, created_at: "2012-03-27 14:54:09 UTC")

    get '/api/v1/customers/find_all?created-at', params: {created_at: customer_1.created_at}

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(2)
    expect(customers.first["id"]).to eq(customer_1.id)
    expect(customers.second["id"]).to eq(customer_4.id)
  end
end
