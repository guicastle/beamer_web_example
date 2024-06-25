import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

// Localização para a rota /home
class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/home'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: HomePage(),
      ),
    ];
  }
}

// Localização para a rota /clientes
class ClientesLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/clientes'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('clientes'),
        title: 'Clientes',
        child: ClientesPage(),
      ),
    ];
  }
}

// Página Home
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          AppDrawer(selectedRoute: '/home'),
          Expanded(
            child: Center(child: Text('Bem-vindo à Home!')),
          ),
        ],
      ),
    );
  }
}

// Página Clientes
class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          AppDrawer(selectedRoute: '/clientes'),
          Expanded(
            child: Center(child: Text('Lista de Clientes')),
          ),
        ],
      ),
    );
  }
}

// Drawer personalizado
class AppDrawer extends StatelessWidget {
  final String selectedRoute;

  const AppDrawer({super.key, required this.selectedRoute});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: selectedRoute == '/home',
            onTap: () {
              Beamer.of(context).beamToNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Clientes'),
            selected: selectedRoute == '/clientes',
            onTap: () {
              Beamer.of(context).beamToNamed('/clientes');
            },
          ),
        ],
      ),
    );
  }
}
