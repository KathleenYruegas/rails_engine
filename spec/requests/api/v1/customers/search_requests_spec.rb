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
end
