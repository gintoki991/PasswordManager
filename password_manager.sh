#!/bin/bash

echo "パスワードマネージャーへようこそ!"

# パスワードを保存するファイルを指定
PASSWORD_FILE="/sh/data/passwords.txt"

while true; do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)：
"
    read operation

    if [ "$operation" = "Add Password" ]; then
        echo "サービス名を入力してください："
        read service
        echo "ユーザー名を入力してください："
        read username
        echo "パスワードを入力してください："
        read password

        # 入力された情報をファイルに追記
        echo "${service}:${username}:${password}" >> $PASSWORD_FILE

        echo "パスワードの追加は成功しました。"
    elif [ "$operation" = "Get Password" ]; then
        echo "サービス名を入力してください："
        read serviceName
        result=$(grep "^$serviceName:" $PASSWORD_FILE 2>/dev/null)
        if [ -z "$result" ]; then
            echo "そのサービスは登録されていません。"
        else
            IFS=':' read -r service user pass <<< "$result"
            echo "サービス名:$service"
            echo "ユーザー名:$user"
            echo "パスワード:$pass"
        fi
    elif [ "$operation" = "Exit" ]; then
        echo "Thank you!"
        break
    else
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
done
