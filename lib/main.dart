import 'package:flutter/material.dart';

void main() {
  runApp(const FoodMapApp());
}

class FoodMapApp extends StatelessWidget {
  const FoodMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodMap',
      theme: ThemeData(
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E8B57),
        ),
      ),
      home: const AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5EC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 450,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFEF9),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 25,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: isLogin
                    ? buildLoginPage()
                    : buildRegisterPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // LOGO
  // --------------------------------------------------

  Widget buildLogo() {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: const Color(0xFFF15A29),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              "🌮",
              style: TextStyle(fontSize: 45),
            ),
          ),
        ),

        const SizedBox(height: 10),

        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.5,
            ),
            children: [
              TextSpan(
                text: "Food",
                style: TextStyle(
                  color: Color(0xFF123F32),
                ),
              ),
              TextSpan(
                text: "Map",
                style: TextStyle(
                  color: Color(0xFF38A05A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // LOGIN
  // --------------------------------------------------

  Widget buildLoginPage() {
    return Column(
      children: [
        buildLogo(),

        const SizedBox(height: 25),

        const Text(
          "Welcome back!",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Color(0xFF123F32),
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          "Find your next favourite bite.",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF52736A),
          ),
        ),

        const SizedBox(height: 30),

        buildTextField(
          controller: emailController,
          hint: "Email or username",
          icon: Icons.person_outline,
        ),

        const SizedBox(height: 16),

        buildTextField(
          controller: passwordController,
          hint: "Password",
          icon: Icons.lock_outline,
          isPassword: true,
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Checkbox(
              value: rememberMe,
              activeColor: const Color(0xFF36975A),
              onChanged: (value) {
                setState(() {
                  rememberMe = value ?? false;
                });
              },
            ),

            const Text(
              "Remember me",
              style: TextStyle(
                color: Color(0xFF52736A),
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  color: Color(0xFF247D48),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        buildMainButton(
          text: "Log In",
          onPressed: () {
            // Login functionality goes here
          },
        ),

        const SizedBox(height: 22),

        buildDivider(),

        const SizedBox(height: 20),

        buildGoogleButton(),

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(
                color: Color(0xFF52736A),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = false;
                });
              },
              child: const Text(
                "Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF247D48),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget buildRegisterPage() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              setState(() {
                isLogin = true;
              });
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF247D48),
            ),
          ),
        ),

        buildLogo(),

        const SizedBox(height: 20),

        const Text(
          "Create your account",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Color(0xFF123F32),
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          "Join FoodMap and never miss your\nfavourite street food again.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            height: 1.4,
            color: Color(0xFF52736A),
          ),
        ),

        const SizedBox(height: 28),

        buildTextField(
          controller: nameController,
          hint: "Full name",
          icon: Icons.person_outline,
        ),

        const SizedBox(height: 14),

        buildTextField(
          controller: emailController,
          hint: "Email address",
          icon: Icons.email_outlined,
        ),

        const SizedBox(height: 14),

        buildTextField(
          controller: passwordController,
          hint: "Password",
          icon: Icons.lock_outline,
          isPassword: true,
        ),

        const SizedBox(height: 14),

        buildTextField(
          controller: confirmPasswordController,
          hint: "Confirm password",
          icon: Icons.lock_outline,
          isPassword: true,
        ),

        const SizedBox(height: 22),

        buildMainButton(
          text: "Sign Up",
          onPressed: () {
            // Registration functionality goes here
          },
        ),

        const SizedBox(height: 22),

        buildDivider(),

        const SizedBox(height: 20),

        buildGoogleButton(),

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account? ",
              style: TextStyle(
                color: Color(0xFF52736A),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = true;
                });
              },
              child: const Text(
                "Log in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF247D48),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --------------------------------------------------
  // TEXT FIELD
  // --------------------------------------------------

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && obscurePassword,
      style: const TextStyle(
        color: Color(0xFF123F32),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF89978F),
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF71877C),
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color(0xFF71877C),
          ),
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        )
            : null,
        filled: true,
        fillColor: const Color(0xFFFAF8F0),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFE4E1D7),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFE4E1D7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF36975A),
            width: 1.5,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // MAIN BUTTON
  // --------------------------------------------------

  Widget buildMainButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF36975A),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // DIVIDER
  // --------------------------------------------------

  Widget buildDivider() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFE0DDD3),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "or",
            style: TextStyle(
              color: Color(0xFF789087),
            ),
          ),
        ),

        const Expanded(
          child: Divider(
            color: Color(0xFFE0DDD3),
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // GOOGLE BUTTON
  // --------------------------------------------------

  Widget buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        onPressed: () {
          // Google login functionality goes here
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Color(0xFF36975A),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "G",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(width: 12),

            const Text(
              "Continue with Google",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF365B50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}