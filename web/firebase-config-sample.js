    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    // Copy and paste your configuration in here

    var firebaseConfig = {
      apiKey: "FIREBASE-API-KEY",
      authDomain: "FIREBASE-AUTH-DOMAIN",
      projectId: "FIREBASE-PROJECT-ID",
      storageBucket: "FIREBASE-STORAGE",
      messagingSenderId: "FIREBASE-MESSAGING-SENDER-ID", // OPTIONAL
      appId: "FIREBASE-APP-ID",
      measurementId: "MEASUREMENT-ID" // OPTIONAL
    };

    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    firebase.analytics();