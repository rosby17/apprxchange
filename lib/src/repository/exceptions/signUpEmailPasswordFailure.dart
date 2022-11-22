// ignore: file_names
class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "Veuillez verifier ce champ"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Veuiller entrer un mot de passe fort');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Veuiller entrer une bonne adresse mail');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'Votre email est déjà utilisé');
      case 'operation_not_allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Opération échoué veuiller contacter le support');
      case 'user-disableg':
        return const SignUpWithEmailAndPasswordFailure(
            'Utilisateur suspendu veuiller contacter le support');
      case 'confirm_password':
        return const SignUpWithEmailAndPasswordFailure(
            'Vos mots de passe ne correspondent pas');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
