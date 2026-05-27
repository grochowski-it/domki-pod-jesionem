export default [
  {
    rules: {
      'no-restricted-imports': [
        'error',
        {
          paths: [
            {
              name: '#imports',
              importNames: ['useSupabaseClient'],
              message: 'KRYTYCZNE: Użyj composable useSupabaseSafe(), standardowy klient pożera limity zapytań.'
            }
          ]
        }
      ]
    }
  }
];
