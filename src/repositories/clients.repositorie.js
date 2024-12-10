/* 
`mt_cli_id` int(11) NOT NULL AUTO_INCREMENT,
`mt_cli_per_id` int(11) NOT NULL,  ----fk persona
`mt_cli_direccion` varchar(300) DEFAULT NULL,
`mt_cli_fecha_nacimiento` date NOT NULL,
`mt_cli_telefono` varchar(13) DEFAULT NULL,
`mt_cli_tipo_consumidor` int(11) NOT NULL, ----fk parametro
`mt_cli_banco` varchar(45) DEFAULT NULL,
`mt_cli_tipo_cuenta` int(11) NOT NULL, ----fk parametro
`mt_cli_cbu` varchar(22) NOT NULL,
mt_cli_provincia varchar(300)
mt_cli_localidad varchar(300)
mt_cli_cuil varchar(22)
mt_cli_telefono2 varchar(13)
mt_cli_observaciones varchar(3000)
mt_cli_tipo_cliente int(11) ----fk parametro
 */

import DB_POOL from "../DB/config.js";

class ClientsRepository {

  static async getClientById(id) {
    try {
      const query = `SELECT * FROM mt_clientes WHERE mt_cli_id = ? `
      const [rows, col] = await DB_POOL.execute(query, [id]);
      return rows.length > 0 ? rows[0] : null
    }
    catch (error) {
      throw (error)
    }
  }


  static async getClientBatteryAlert (state = 0) {
    try {

    const query = `SELECT * FROM mt_clientes WHERE mt_cli_alertaBateria = ? AND mt_cli_cambioBateria IS NOT NULL `;
    const [rows, col] = await DB_POOL.execute(query, [0, ]);
    /* console.log(rows.length + 'asdsad') */

    return rows.length > 0 ? rows : [];
    }
    catch (error) {
      console.log(error)
      throw (error)
    }
  }

  static async getClients() {
    try {
      const query = `SELECT * FROM mt_clientes `
      const [rows, col] = await DB_POOL.execute(query);
      return rows.length > 0 ? rows : null
    }
    catch (error) {
      throw (error)
    }
  }

  static async createClient(data, personID) {
    try {
      const { direccion, fecha_nacimiento, telefono, tipo_consumidor, banco, tipo_cuenta, cbu, provincia, localidad, cuil, telefono2, observaciones, tipo_cliente } = data
      const query = `INSERT INTO mt_clientes (
      mt_cli_per_id,
      mt_cli_direccion,
      mt_cli_fecha_nacimiento,
      mt_cli_telefono,
      mt_cli_tipo_consumidor,
      mt_cli_banco,
      mt_cli_tipo_cuenta,
      mt_cli_cbu,
      mt_cli_provincia,
      mt_cli_localidad,
      mt_cli_cuil,
      mt_cli_telefono2,
      mt_cli_observaciones,
      mt_cli_tipo_cliente ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`

      const [rows, col] = await DB_POOL.execute(query,
        [
          personID,
          direccion,
          fecha_nacimiento,
          telefono,
          tipo_consumidor,
          banco,
          tipo_cuenta,
          cbu,
          provincia,
          localidad,
          cuil,
          telefono2,
          observaciones,
          tipo_cliente
        ]);

      return {
        id: rows.insertId,
        ...data
      }

    }
    catch (error) {
      throw (error)
    }
  }

  static async deleteClientById(id) {
    try {
      const query = `DELETE FROM mt_clientes WHERE mt_cli_id = ?`
      const [rows, col] = await DB_POOL.execute(query, [id]);
      return rows
    }
    catch (error) {
      throw (error)
    }
  }

  static async updateClientById(data, id) {
    try {
      const { direccion, fecha_nacimiento, telefono, tipo_consumidor, banco, tipo_cuenta, cbu, provincia, localidad, cuil, telefono2, observaciones, tipo_cliente } = data

      const query = `UPDATE mt_clientes SET 
      mt_cli_direccion = ?,
      mt_cli_fecha_nacimiento = ?,
      mt_cli_telefono = ?,
      mt_cli_tipo_consumidor = ?,
      mt_cli_banco = ?,
      mt_cli_tipo_cuenta = ?,
      mt_cli_cbu = ?,
      mt_cli_provincia = ?,
      mt_cli_localidad = ?,
      mt_cli_cuil = ?,
      mt_cli_telefono2 = ?,
      mt_cli_observaciones = ?,
      mt_cli_tipo_cliente = ?
      WHERE mt_cli_id = ?`
      const [rows, col] = await DB_POOL.execute(query,
        [
          direccion,
          fecha_nacimiento && new Date(fecha_nacimiento).toISOString().split('T')[0] || null,
          telefono,
          tipo_consumidor,
          banco,  
          tipo_cuenta,
          cbu,
          provincia,
          localidad,  
          cuil,
          telefono2,
          observaciones,
          tipo_cliente,
          id
        ]);
      return rows
    }
    catch (error) {
      throw (error)
    }
  }

  static async updateClientBatteryById(data, id) {
    try {
      const { cambioBateria, alertaBateria } = data
      const query = `UPDATE mt_clientes SET 
      mt_cli_cambioBateria = ?,
      mt_cli_alertaBateria = ?
      WHERE mt_cli_id = ?`
      //console.log(cambioBateria &&cambioBateria.toISOString().split('T')[0], alertaBateria, id)
      const [rows, col] = await DB_POOL.execute(query,
        [
          cambioBateria && new Date(cambioBateria).toISOString().split('T')[0],
          alertaBateria,
          id
        ]);
        /* 
        arreglar, 
        si cambio de bateria existe, dejar esa fecha.
        si no tiene services, dejar null.
        
        */
        //console.log(rows, cambioBateria, alertaBateria, id)
      return rows
    }
    catch (error) {
      throw (error)
    }
  }

  static async updateClientProductsById(data, id) {
    try {

      const { JSON } = data

      const query = `UPDATE mt_clientes SET 
      mt_cli_productosInstalados= ?
      WHERE mt_cli_id = ?`
      const [rows, col] = await DB_POOL.execute(query,
        [
          JSON,
          id
        ]);
      return rows
    }
    catch (error) {
      console.log(error)
      throw (error)
    }
  }

}

/* const asd = async () => {
  const result = await ClientsRepository.getClientBatteryAlert()
}

asd() */



export default ClientsRepository