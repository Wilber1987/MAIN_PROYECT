﻿using CAPA_DATOS;
using System;
using System.Collections.Generic;
using System.Text;


namespace CAPA_NEGOCIO.Security
{
    public class Security_Roles : EntityClass
    {
        public int? Id_Role { get; set; }
        public string? Descripcion { get; set; }
        public string? Estado { get; set; }
        [OneToMany(TableName = "Security_Permissions_Roles", KeyColumn = "Id_Role", ForeignKeyColumn = "Id_Role")]
        public List<Security_Permissions_Roles>? Security_Permissions_Roles { get; set; }
        public object SaveRole()
        {
            if (this.Id_Role == null)
            {
                this.Save();
            }
            else
            {
                this.Update("Id_Role");
            }
            if (this.Security_Permissions_Roles != null)
            {
                Security_Permissions_Roles IdI = new Security_Permissions_Roles();
                IdI.Id_Role = this.Id_Role;
                IdI.Delete();
                foreach (Security_Permissions_Roles obj in this.Security_Permissions_Roles)
                {
                    obj.Id_Role = this.Id_Role;
                    obj.Save();
                }
            }
            return this;
        }
        public object GetRolData()
        {
            this.Security_Permissions_Roles = new Security_Permissions_Roles()
            {
                Id_Role = this.Id_Role
            }.Get<Security_Permissions_Roles>();
            return this.Security_Permissions_Roles;

        }
        public List<Security_Roles>? GetRoles()
        {
            var roles = this.Get<Security_Roles>();
            foreach (Security_Roles role in roles)
            {
                role.GetRolData();
            }
            return roles;
        }
    }
    public class Security_Users : EntityClass
    {
        [PrimaryKey(Identity = true)]
        public int? Id_User { get; set; }
        public string? Nombres { get; set; }
        public string? Estado { get; set; }
        public string? Descripcion { get; set; }
        public string? Password { get; set; }
        public string? Mail { get; set; }
        public string? Token { get; set; }
        public DateTime? Token_Date { get; set; }
        public DateTime? Token_Expiration_Date { get; set; }
        [OneToMany(TableName = "Security_Users_Roles", KeyColumn = "Id_User", ForeignKeyColumn = "Id_User")]
        public List<Security_Users_Roles>? Security_Users_Roles { get; set; }
        public Security_Users? GetUserData()
        {
            Security_Users? user = this.Find<Security_Users>();
            if (user != null)
            {
                user.Security_Users_Roles = new Security_Users_Roles()
                {
                    Id_User = this.Id_User
                }.Get<Security_Users_Roles>();
                foreach (Security_Users_Roles role in user.Security_Users_Roles ?? new List<Security_Users_Roles>())
                {
                    role.Security_Role?.GetRolData();
                }
            }
            return user;
        }
        public object SaveUser()
        {
            this.Password = EncrypterServices.Encrypt(this.Password);
            if (this.Id_User == null)
            {
                if (new Security_Users() { Mail = this.Mail }.Exists<Security_Users>())
                {
                    throw new Exception("Correo en uso");
                }
                this.Save();
            }
            else
            {
                this.Update("Id_User");
            }
            if (this.Security_Users_Roles != null)
            {
                Security_Users_Roles IdI = new Security_Users_Roles();
                IdI.Id_User = this.Id_User;
                IdI.Delete();
                foreach (Security_Users_Roles obj in this.Security_Users_Roles)
                {
                    obj.Id_User = this.Id_User;
                    obj.Save();
                }
            }
            return this;
        }
        public object GetUsers()
        {
            var Security_Users_List = this.Get<Security_Users>();
            foreach (Security_Users User in Security_Users_List)
            {
                User.Security_Users_Roles =
                    (new Security_Users_Roles()).Get_WhereIN<Security_Users_Roles>(
                         "Id_User", new string?[] { User.Id_User.ToString() });
            }
            return Security_Users_List;
        }
    }
    public class Security_Permissions : EntityClass
    {
        [PrimaryKey(Identity = true)]
        public int? Id_Permission { get; set; }
        public string? Descripcion { get; set; }
        public string? Estado { get; set; }
    }
    public class Security_Permissions_Roles : EntityClass
    {
        [PrimaryKey(Identity = false)]
        public int? Id_Role { get; set; }
        [PrimaryKey(Identity = false)]
        public int? Id_Permission { get; set; }
        public string? Estado { get; set; }
        [ManyToOne(TableName = "Security_Permissions", KeyColumn = "Id_Permission", ForeignKeyColumn = "Id_Permission")]
        public Security_Permissions? Security_Permissions { get; set; }
    }
    public class Security_Users_Roles : EntityClass
    {
        [PrimaryKey(Identity = false)]
        public int? Id_Role { get; set; }
        [PrimaryKey(Identity = false)]
        public int? Id_User { get; set; }
        public string? Estado { get; set; }
        [ManyToOne(TableName = "Security_Role", KeyColumn = "Id_Role", ForeignKeyColumn = "Id_Role")]
        public Security_Roles? Security_Role { get; set; }

    }
}
