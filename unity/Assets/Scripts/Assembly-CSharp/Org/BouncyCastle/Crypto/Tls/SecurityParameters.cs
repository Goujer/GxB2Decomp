namespace Org.BouncyCastle.Crypto.Tls
{
	public class SecurityParameters
	{
		internal int entity;

		internal int cipherSuite;

		internal byte compressionAlgorithm;

		internal int prfAlgorithm;

		internal int verifyDataLength;

		internal byte[] masterSecret;

		internal byte[] clientRandom;

		internal byte[] serverRandom;

		internal byte[] sessionHash;

		internal byte[] pskIdentity;

		internal byte[] srpIdentity;

		internal short maxFragmentLength;

		internal bool truncatedHMac;

		internal bool encryptThenMac;

		internal bool extendedMasterSecret;

		public virtual int Entity
		{
			get
			{
				return 0;
			}
		}

		public virtual int CipherSuite
		{
			get
			{
				return 0;
			}
		}

		public byte CompressionAlgorithm
		{
			get
			{
				return 0;
			}
		}

		public virtual int PrfAlgorithm
		{
			get
			{
				return 0;
			}
		}

		public virtual int VerifyDataLength
		{
			get
			{
				return 0;
			}
		}

		public virtual byte[] MasterSecret
		{
			get
			{
				return null;
			}
		}

		public virtual byte[] ClientRandom
		{
			get
			{
				return null;
			}
		}

		public virtual byte[] ServerRandom
		{
			get
			{
				return null;
			}
		}

		public virtual byte[] SessionHash
		{
			get
			{
				return null;
			}
		}

		public virtual byte[] PskIdentity
		{
			get
			{
				return null;
			}
		}

		public virtual byte[] SrpIdentity
		{
			get
			{
				return null;
			}
		}

		internal virtual void Clear()
		{
		}
	}
}
