require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
    # テストケースごとに変わる値部分はletで定義し、テストケースごとに上書きできるようにしておく
    let(:user) { FactoryBot.build(name: name, email: email, password_digest: password_digest) }
    let(:name) { "user name" }
    let(:email) { "tester@example.com" }
    let(:password_digest) { "dottle-nouveau-pavilion-tights-furze" }

    context "メールアドレスがない場合" do
      let(:email) { nil }

      it "バリデーションエラーとなる" do
        user.valid?
        
        expect(user.errors[:email]).to include("can't be blank")
      end
    end

    context "メールアドレスが既に登録済みの場合" do
      # AAAパターンを意識する
      # 準備(arrange)
      before do
        FactoryBot.create(name: "another user", email: email, password_digest: "dottle-nouveau-pavilion-tights-furze")
      end

      it "バリデーションエラーとなる" do
        # 実行(act)
        user.valid?
        
        # 検証(assert)
        expect(user.errors[:email]).to include("has already been taken")
      end
    end
  end

  # 名、メール、パスワードがあれば有効な状態であること
  it "is valid with a first name, last name, email, and password" do
    user =  FactoryBot.create(:user,:a)
    expect(user).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without a first name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      name:  "Joe",
      email:      "tester@example.com",
      password_digest:   "dottle-nouveau-pavilion-tights-furze",
    )

    user = User.new(
      name:  "Jane",
      email:      "tester@example.com",
      password_digest:   "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end


end
