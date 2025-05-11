namespace Org.BouncyCastle.Crypto.Engines
{
	public class ChaChaEngine : Salsa20Engine
	{
		public override string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public ChaChaEngine()
		{
		}

		public ChaChaEngine(int rounds)
		{
		}

		protected override void AdvanceCounter()
		{
		}

		protected override void ResetCounter()
		{
		}

		protected override void SetKey(byte[] keyBytes, byte[] ivBytes)
		{
		}

		protected override void GenerateKeyStream(byte[] output)
		{
		}

		internal static void ChachaCore(int rounds, uint[] input, uint[] x)
		{
		}
	}
}
