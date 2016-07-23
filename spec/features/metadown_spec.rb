

feature 'metadown' do

  scenario 'Parse Meta Data - no markdown' do
    data = Metadown.render("hello world")
    expect(data.metadata).to eq({})
  end

  scenario 'Parse Meta Data - no markdown' do
    data = Metadown.render(%Q{
---\n
 key: 12\n
---\n
 Hello World!
    })
    expect(data.metadata).to eq({"key" =>12})
  end
end
