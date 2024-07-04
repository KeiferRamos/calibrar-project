const get = '''
  query Recipients {
    recipients {
        id
        bank
        account_number
        first_name
        middle_name
        last_name
        email
        account_name
    }
  }
''';

const add = r'''
  mutation CreateRecipient($input: CreateRecipientInput!) {
    createRecipient(
        createRecipientInput: $input
    ) {
        id
        bank
        account_number
        first_name
        middle_name
        last_name
        email
        account_name
    }
  }
''';

const getById = r'''
  query Recipient($id: String!) {
    recipient(id: $id) {
        id
        bank
        account_number
        first_name
        middle_name
        last_name
        email
        account_name
    }
}
''';

const delete = r'''
  mutation RemoveRecipient($id: String!) {
    removeRecipient(id: $id) {
        id
    }
  }
''';
