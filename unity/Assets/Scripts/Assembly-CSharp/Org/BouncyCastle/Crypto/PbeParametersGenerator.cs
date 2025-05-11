using System;

namespace Org.BouncyCastle.Crypto
{
	public abstract class PbeParametersGenerator
	{
		protected byte[] mPassword;

		protected byte[] mSalt;

		protected int mIterationCount;

		public virtual byte[] Password
		{
			get
			{
				return null;
			}
		}

		public virtual byte[] Salt
		{
			get
			{
				return null;
			}
		}

		public virtual int IterationCount
		{
			get
			{
				return 0;
			}
		}

		public virtual void Init(byte[] password, byte[] salt, int iterationCount)
		{
		}

		[Obsolete]
		public byte[] GetPassword()
		{
			return null;
		}

		[Obsolete]
		public byte[] GetSalt()
		{
			return null;
		}

		[Obsolete]
		public abstract ICipherParameters GenerateDerivedParameters(int keySize);

		public abstract ICipherParameters GenerateDerivedParameters(string algorithm, int keySize);

		[Obsolete]
		public abstract ICipherParameters GenerateDerivedParameters(int keySize, int ivSize);

		public abstract ICipherParameters GenerateDerivedParameters(string algorithm, int keySize, int ivSize);

		public abstract ICipherParameters GenerateDerivedMacParameters(int keySize);

		public static byte[] Pkcs5PasswordToBytes(char[] password)
		{
			return null;
		}

		[Obsolete]
		public static byte[] Pkcs5PasswordToBytes(string password)
		{
			return null;
		}

		public static byte[] Pkcs5PasswordToUtf8Bytes(char[] password)
		{
			return null;
		}

		[Obsolete]
		public static byte[] Pkcs5PasswordToUtf8Bytes(string password)
		{
			return null;
		}

		public static byte[] Pkcs12PasswordToBytes(char[] password)
		{
			return null;
		}

		public static byte[] Pkcs12PasswordToBytes(char[] password, bool wrongPkcs12Zero)
		{
			return null;
		}
	}
}
