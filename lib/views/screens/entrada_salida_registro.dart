import 'package:flutter/material.dart';

class RegistroAsistencia extends StatelessWidget {
  final TextEditingController _comentariosController = TextEditingController();
  
  // Datos del usuario simulados
  final Map<String, String> _userData = {
    "Nombre": "Eddy Ricardo \n Monago del Aguila",
    "Puesto": "Desarrollador de Software",
    "Departamento": "TI",
    "Foto": "https://scontent.flim23-1.fna.fbcdn.net/v/t1.18169-9/18698096_10203319177977549_1786612228346692954_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=53a332&_nc_ohc=rLPZeELVB64Q7kNvgEDO-mg&_nc_ht=scontent.flim23-1.fna&oh=00_AYCj_bKNojDBbubXZmbyONRM9rbsHP92QHmjOJOmPQ2zDw&oe=66F3812E", // Reemplaza con la URL de la foto real
  };

  RegistroAsistencia({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = size.height > size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Registro de Asistencia', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                _getFormattedDate(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isPortrait
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserCard(size),
                  const SizedBox(height: 20),
                  _buildRegistroForm(size),
                  const SizedBox(height: 20),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _buildUserCard(size)),
                  const SizedBox(width: 20),
                  Expanded(child: _buildRegistroForm(size)),
                ],
              ),
      ),
      backgroundColor: Colors.black,
    );
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    return "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
  }

  Widget _buildUserCard(Size size) {
    return Card(
      color: Colors.grey[900],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: size.width * 0.08, // Ajusta el tamaño en función del ancho de la pantalla
              backgroundImage: NetworkImage(_userData["Foto"]!),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userData["Nombre"]!,
                  style: TextStyle(
                    fontSize: size.width * 0.05, // Ajusta el tamaño de la fuente en función del ancho de la pantalla
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _userData["Puesto"]!,
                  style: TextStyle(
                    fontSize: size.width * 0.04, // Ajusta el tamaño de la fuente en función del ancho de la pantalla
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _userData["Departamento"]!,
                  style: TextStyle(
                    fontSize: size.width * 0.04, // Ajusta el tamaño de la fuente en función del ancho de la pantalla
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistroForm(Size size) {
    return Card(
      color: Colors.grey[850],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _comentariosController,
              decoration: InputDecoration(
                labelText: 'Comentarios (Opcional)',
                prefixIcon: const Icon(Icons.comment, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
              ),
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Acción para registrar inicio
                    },
                    icon: const Icon(Icons.login, color: Colors.white),
                    label: const Text('Registrar Inicio', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Acción para registrar salida
                    },
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text('Registrar Salida', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
